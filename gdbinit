source /home/jon/.gdbinit-gef.py

set filename-display basename

# 保存历史命令
set history filename ./.gdb_history
set history save on

# 退出并保留断点
define qbp
save breakpoints ./.gdb_bp
quit
end
document qbp
Exit and save the breakpoint
end

# 保留历史工作断点
define savebp
save breakpoints ./.gdb_bp
end
document savebp
Save the historical work breakpoint
end
 
 
# 加载历史工作断点
define loadbp
source ./.gdb_bp
end
document loadbp
Load the historical work breakpoint
end

define rmt
target remote:8832
end
document rmt
link to remote target
end

define undisplay
gef config context.enable 0
end
document undisplay
undisplay gef context
end

define selx
set architecture i386:x86-64
end
document selx
set architecture i386:x86-64
end

define add-symbol-file-auto
  # Parse .text address to temp file
  shell echo set \$text_address=$(readelf -WS $arg0 | grep .text | awk '{ print "0x"$5 }') >/tmp/temp_gdb_text_address.txt

  # Source .text address
  source /tmp/temp_gdb_text_address.txt

  #  Clean tempfile
  shell rm -f /tmp/temp_gdb_text_address.txt

  # Load symbol table
  add-symbol-file $arg0 $text_address
end
document add-symbol-file-auto
add symbol file automaticly at .text address.
end
#source /home/jon/.local/lib/python3.6/site-packages/voltron/entry.py

python
import subprocess
import re

def relocatesections(filename, addr):
    p = subprocess.Popen(["readelf", "-S", filename], stdout = subprocess.PIPE)

    sections = []
    textaddr = '0'
    for line in p.stdout.readlines():
        line = line.decode("utf-8").strip()
        if not line.startswith('[') or line.startswith('[Nr]'):
            continue

        line = re.sub(r' +', ' ', line)
        line = re.sub(r'\[ *(\d+)\]', '\g<1>', line)
        fieldsvalue = line.split(' ')
        fieldsname = ['number', 'name', 'type', 'addr', 'offset', 'size', 'entsize', 'flags', 'link', 'info', 'addralign']
        sec = dict(zip(fieldsname, fieldsvalue))

        if sec['number'] == '0':
            continue

        sections.append(sec)

        if sec['name'] == '.text':
            textaddr = sec['addr']

    return (textaddr, sections)


class AddSymbolFileAll(gdb.Command):
    """The right version for add-symbol-file"""

    def __init__(self):
        super(AddSymbolFileAll, self).__init__("add-symbol-file-all", gdb.COMMAND_USER)
        self.dont_repeat()

    def invoke(self, arg, from_tty):
        argv = gdb.string_to_argv(arg)
        filename = argv[0]

        if len(argv) > 1:
            offset = int(str(gdb.parse_and_eval(argv[1])), 0)
        else:
            offset = 0

        (textaddr, sections) = relocatesections(filename, offset)

        cmd = "add-symbol-file %s 0x%08x" % (filename, int(textaddr, 16) + offset)

        for s in sections:
            addr = int(s['addr'], 16)
            if s['name'] == '.text' or addr == 0:
                continue

            cmd += " -s %s 0x%08x" % (s['name'], addr + offset)

        gdb.execute(cmd)

class RemoveSymbolFileAll(gdb.Command):
    """The right version for remove-symbol-file"""

    def __init__(self):
        super(RemoveSymbolFileAll, self).__init__("remove-symbol-file-all", gdb.COMMAND_USER)
        self.dont_repeat()

    def invoke(self, arg, from_tty):
        argv = gdb.string_to_argv(arg)
        filename = argv[0]

        if len(argv) > 1:
            offset = int(str(gdb.parse_and_eval(argv[1])), 0)
        else:
            offset = 0

        (textaddr, _) = relocatesections(filename, offset)

        cmd = "remove-symbol-file -a 0x%08x" % (int(textaddr, 16) + offset)
        gdb.execute(cmd)


AddSymbolFileAll()
RemoveSymbolFileAll()
end

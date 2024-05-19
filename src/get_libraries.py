import subprocess
import sys

libraries = ['psycopg2', 'tabulate']
def import_install_libraries(library):
    try:
        __import__(library)
    except ImportError:
        print(f'Installing {library}')
        subprocess.check_call([sys.executable, "-m", "pip", "install", library])
        print(f'{library} installed')

for library in libraries:
    import_install_libraries(library)
    
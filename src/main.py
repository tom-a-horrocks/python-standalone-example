from pathlib import Path

from PySide2.QtWidgets import QApplication, QLabel

resource_path = Path(__file__).parent / 'resources'

if __name__ == '__main__':
    print('Hello world!')
    print(f'Version v{(resource_path / "version.txt").read_text()}')

    app = QApplication()
    window = QLabel(f'Version v{(resource_path / "version.txt").read_text()}')
    window.show()
    app.exec_()

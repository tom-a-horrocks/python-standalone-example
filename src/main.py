from pathlib import Path

resource_path = Path(__file__).parent / 'resources'

if __name__ == '__main__':
    print('Hello world!')
    print(f'Version v{(resource_path / "version.txt").read_text()}')

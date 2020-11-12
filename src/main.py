from pathlib import Path

if __name__ == '__main__':
    # MUST look up resource path here, otherwise Nuitka will hard-code the
    # build environment's value for __file__.
    resource_path = Path(__file__).parent / 'resources'

    print('Hello world!')
    print(f'Version v{(resource_path / "version.txt").read_text()}')

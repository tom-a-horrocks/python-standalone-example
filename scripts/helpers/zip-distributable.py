import shutil
from pathlib import Path

project_name = Path('./project_name.txt').read_text()
version_number = Path('src/resources/version.txt').read_text()
version_tag = f'v{version_number}'

shutil.make_archive(
    base_name=f'dist/{project_name}-{version_tag}',
    format='zip',
    root_dir='dist',
    base_dir=project_name)

from flask import Blueprint
from . import db

bp = Blueprint('upload', __name__ ,url_prefix='/upload')


@bp.route('/create')
def create_upload():
    return 'single upload view'

@bp.route('/<int:id>/view')
def single_upload(id):
    return f'single {id} upload view'

@bp.route('/list')
def list_view():
    return 'upload list'

@bp.route('/<int:id>/update')
def update_upload(id):
    return f'update {id} note'

@bp.route('/<int:id>/delete')
def delete_upload(id):
    return f'delete {id} upload'
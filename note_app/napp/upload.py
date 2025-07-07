from flask import Blueprint
from . import db

bp = Blueprint('main', __name__ ,url_prefix='/upload')


@bp.route('/create')
def create_upload():
    return 'single upload view'

@bp.route('/<int:id>')
def single_upload():
    return 'single upload view'

@bp.route('/list')
def list_view():
    return 'upload list'

@bp.route('/<int:id>/update')
def update_upload():
    return 'update note'

@bp.route('/<int:id>/delete')
def delete_upload():
    return 'delete upload'
from flask import Blueprint
from . import db

bp = Blueprint('note', __name__ ,url_prefix='/note')


@bp.route('/create')
def create_note():
    return 'create note'

@bp.route('/<int:id>/view')
def single_note(id):
    return f'single {id} note view'

@bp.route('/list')
def list_view():
    return 'note list '

@bp.route('/<int:id>/update')
def update_note(id):
    return f'update {id} note'

@bp.route('/<int:id>/delete')
def delete_note(id):
    return f'delete {id} note'
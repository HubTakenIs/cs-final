from flask import Blueprint
from . import db

bp = Blueprint('main', __name__ ,url_prefix='/note')


@bp.route('/create')
def create_note():
    return 'single note view'

@bp.route('/<int:id>')
def single_note():
    return 'single note view'

@bp.route('/list')
def list_view():
    return 'note list '

@bp.route('/<int:id>/update')
def update_note():
    return 'update note'

@bp.route('/<int:id>/delete')
def delete_note():
    return 'delete note'
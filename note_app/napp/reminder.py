from flask import Blueprint
from . import db

bp = Blueprint('reminder', __name__ ,url_prefix='/reminder')


@bp.route('/create')
def create_reminder():
    return 'single reminder view'

@bp.route('/<int:id>/view')
def single_reminder(id):
    return f'single reminder {id} view'

@bp.route('/list')
def list_view():
    return 'reminder list '

@bp.route('/<int:id>/update')
def update_reminder(id):
    return f'update {id} reminder'

@bp.route('/<int:id>/delete')
def delete_reminder(id):
    return f'delete {id} reminder'
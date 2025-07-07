from flask import Blueprint
from . import db

bp = Blueprint('main', __name__ ,url_prefix='/reminder')


@bp.route('/create')
def create_reminder():
    return 'single reminder view'

@bp.route('/<int:id>')
def single_reminder():
    return 'single reminder view'

@bp.route('/list')
def list_view():
    return 'reminder list '

@bp.route('/<int:id>/update')
def update_reminder():
    return 'update reminder'

@bp.route('/<int:id>/delete')
def delete_reminder():
    return 'delete reminder'
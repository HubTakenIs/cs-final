from flask import Blueprint
from . import db

bp = Blueprint('main', __name__)

@bp.route('/')
def index():
    return 'Index'

@bp.route('/dashboard')
def profile():
    return 'dashboard'
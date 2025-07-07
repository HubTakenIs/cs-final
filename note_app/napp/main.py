from flask import Blueprint, render_template
from . import db

bp = Blueprint('main', __name__)

@bp.route('/')
def index():
    return render_template('base.html')

@bp.route('/dashboard')
def profile():
    return 'dashboard'
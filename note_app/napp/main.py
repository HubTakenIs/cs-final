from flask import Blueprint, render_template,redirect,url_for
from . import db

bp = Blueprint('main', __name__)

@bp.route('/')
def index():
    return redirect(url_for('note.list'))

@bp.route('/dashboard')
def profile():
    return 'dashboard'
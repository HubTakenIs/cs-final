import functools

from flask import (
    Blueprint, flash, g, redirect, render_template, request, session, url_for
)
from werkzeug.security import check_password_hash, generate_password_hash

from napp.db import get_db

bp = Blueprint('auth', __name__, url_prefix='/auth')

@bp.route('/register', methods=('GET', 'POST'))
def register():
    return "register"

@bp.route('/login', methods=('GET', 'POST'))
def login():
    return "login"

@bp.route('/logout')
def logout():
    return "logout"


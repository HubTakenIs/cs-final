from flask import Blueprint, render_template, flash, request, redirect, url_for, g
from napp.db import get_db


bp = Blueprint('note', __name__ ,url_prefix='/note')


@bp.route('/create', methods=('GET', 'POST'))
def create():
    if request.method == 'POST':
        title = request.form['title']
        body = request.form['body']
        error = None

        if not title:
            error = 'Title is required.'

        if error is not None:
            flash(error)
        else:
            db = get_db()
            db.execute(
                'INSERT INTO note (title, body, author_id)'
                ' VALUES (?, ?, ?)',
                (title, body, g.user['id'])
            )
            db.commit()
            return redirect(url_for('note.list'))
    return render_template('note/create.html')

@bp.route('/<int:id>/view')
def single_note(id):
    return f'single {id} note view'

@bp.route('/list')
def list():
    db = get_db()
    notes = db.execute(
        'SELECT n.id, title, body, created, author_id, username'
        ' FROM note n JOIN user u ON n.author_id = u.id'
        ' ORDER BY created DESC'
    ).fetchall()
    return render_template('note/list.html',notes=notes)

@bp.route('/<int:id>/update')
def update(id):
    return f'update {id} note'

@bp.route('/<int:id>/delete')
def delete(id):
    return f'delete {id} note'
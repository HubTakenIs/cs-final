from flask import Blueprint, render_template, flash, request, redirect, url_for, g, abort
from napp.db import get_db
from napp.auth import login_required


bp = Blueprint('note', __name__ ,url_prefix='/note')


@bp.route('/create', methods=('GET', 'POST'))
@login_required
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
@login_required
def single_note(id):
    return f'single {id} note view'

@bp.route('/list')
@login_required
def list():
    db = get_db()
    notes = db.execute(
        'SELECT n.id, title, body, created, author_id, username'
        ' FROM note n JOIN user u ON n.author_id = u.id'
        ' ORDER BY created DESC'
    ).fetchall()
    return render_template('note/list.html',notes=notes)

@bp.route('/<int:id>/update',methods=('GET', 'POST'))
@login_required
def update(id):
    note = get_note(id)

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
                'UPDATE note SET title = ?, body = ?'
                ' WHERE id = ?',
                (title, body, id)
            )
            db.commit()
            return redirect(url_for('note.list'))

    return render_template('note/update.html', note=note)

@bp.route('/<int:id>/delete', methods=('POST',))
@login_required
def delete(id):
    get_note(id)
    db = get_db()
    db.execute('DELETE FROM note WHERE id = ?', (id,))
    db.commit()
    return redirect(url_for('note.list'))

def get_note(id, check_author=True):
    note = get_db().execute(
        'SELECT n.id, title, body, created, author_id, username'
        ' FROM note n JOIN user u ON n.author_id = u.id'
        ' WHERE n.id = ?',
        (id,)
    ).fetchone()

    if note is None:
        abort(404, f"Note id {id} doesn't exist.")

    if check_author and note['author_id'] != g.user['id']:
        abort(403)

    return note
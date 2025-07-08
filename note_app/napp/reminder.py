from flask import Blueprint,flash,render_template,request,redirect,g,url_for
from napp.db import get_db
from napp.auth import login_required

bp = Blueprint('reminder', __name__ ,url_prefix='/reminder')


@bp.route('/create')
@bp.route('/create', methods=('GET', 'POST'))
@login_required
def create():
    if request.method == 'POST':
        title = request.form['title']
        body = request.form['body']
        due = request.form['review_date']
        error = None

        if not title:
            error = 'Title is required.'
        
        if not due:
            error = 'Review date is required.'

        if error is not None:
            flash(error)
        else:
            db = get_db()
            db.execute(
                'INSERT INTO reminder (title, body, author_id,due)'
                ' VALUES (?, ?, ?,?)',
                (title, body, g.user['id'], due)
            )
            db.commit()
            return redirect(url_for('reminder.list'))
    return render_template('reminder/create.html')


@bp.route('/<int:id>/view')
def view(id):
    return f'single reminder {id} view'

@bp.route('/list')
@login_required
def list():
    db = get_db()
    reminders = db.execute(
        'SELECT r.id, title, body, created, author_id, username,due'
        ' FROM reminder r JOIN user u ON r.author_id = u.id'
        ' ORDER BY created DESC'
    ).fetchall()
    return render_template('reminder/list.html',reminders=reminders)


@bp.route('/<int:id>/update')
def update(id):
    return f'update {id} reminder'

@bp.route('/<int:id>/delete')
def delete(id):
    return f'delete {id} reminder'
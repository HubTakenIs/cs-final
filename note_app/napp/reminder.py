from datetime import datetime
from flask import Blueprint,flash,render_template,request,redirect,g,url_for,abort, current_app
from napp.db import get_db 
from napp.auth import login_required

bp = Blueprint('reminder', __name__ ,url_prefix='/reminder')


@bp.route('/create', methods=('GET', 'POST'))
@login_required
def create():
    if request.method == 'POST':
        title = request.form['title']
        body = request.form['body']
        due = request.form['due']
        time = request.form['time']
        error = None
        current_app.logger.debug(f"{title},{body},{due},{time}")
        # doesn't seem to work
        if due:
            try:
                due = datetime.strptime(due, "%Y-%m-%d")
            except ValueError:
                error = "Invalid date format. Use YYYY-MM-DD."
                return redirect(url_for("reminder.create"))
        else:
            due = None  # Or a default if needed

        if not title:
            error = 'Title is required.'
        
        if not due:
            error = 'Review date is required.'

        if error is not None:
            flash(error)
        else:
            db = get_db()
            db.execute(
                'INSERT INTO reminder (title, body, author_id,due,time)'
                ' VALUES (?, ?, ?,?,?)',
                (title, body, g.user['id'], due,time)
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
        'SELECT r.id, title, body, created, author_id, username,  date(due) as due,time'
        ' FROM reminder r JOIN user u ON r.author_id = u.id'
        ' WHERE u.id = ?'
        ' ORDER BY created DESC',
        (str(g.user['id']))
    ).fetchall()
    return render_template('reminder/list.html',reminders=reminders)


@bp.route('/<int:id>/update',methods=('GET', 'POST'))
@login_required
def update(id):
    reminder = get_reminder(id)

    if request.method == 'POST':
        title = request.form['title']
        body = request.form['body']
        due = request.form['due']
        error = None

        if not title:
            error = 'Title is required.'
        
        if due:
            try:
                due = datetime.strptime(due, "%Y-%m-%d")
            except ValueError:
                error = "Invalid date format. Use YYYY-MM-DD."
                # i didn't flash error. 
                return redirect(url_for("reminder.create"))
        else:
            due = None  # Or a default if needed

        if error is not None:
            flash(error)
        else:
            db = get_db()
            db.execute(
                'UPDATE reminder SET title = ?, body = ?, due = ?'
                ' WHERE id = ?',
                (title, body, due, id)
            )
            db.commit()
            return redirect(url_for('reminder.list'))
    return render_template('reminder/update.html', reminder=reminder)
        

@bp.route('/<int:id>/delete', methods=('POST',))
@login_required
def delete(id):
    get_reminder(id)
    db = get_db()
    db.execute('DELETE FROM reminder WHERE id = ?', (id,))
    db.commit()
    return redirect(url_for('reminder.list'))

def get_reminder(id, check_author=True):
    reminder = get_db().execute(
        'SELECT r.id, title, body, created, author_id, username,due'
        ' FROM reminder r JOIN user u ON r.author_id = u.id'
        ' WHERE r.id = ?',
        (id,)
    ).fetchone()

    if reminder is None:
        abort(404, f"Reminder id {id} doesn't exist.")

    if check_author and reminder['author_id'] != g.user['id']:
        abort(403)

    return reminder
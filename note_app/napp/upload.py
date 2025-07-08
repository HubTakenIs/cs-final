from flask import Blueprint, render_template, flash, request, redirect, url_for, g, abort, current_app
from werkzeug.utils import secure_filename
from napp.db import get_db
from napp.auth import login_required
import os

bp = Blueprint('upload', __name__ ,url_prefix='/upload')

def allowed_file(filename):
    return '.' in filename and \
           filename.rsplit('.', 1)[1].lower() in current_app.config['ALLOWED_EXTENSIONS']

@bp.route('/create',methods=("POST","GET"))
@login_required
def create():
    if request.method == "POST":
        title = request.form["title"]
        # save file
        if 'file' not in request.files:
            flash('No file part')
            return redirect(request.url)
        file = request.files['file']
        # If the user does not select a file, the browser submits an
        # empty file without a filename.
        if file.filename == '':
            flash('No selected file')
            return redirect(request.url)
        if file and allowed_file(file.filename):
            filename = secure_filename(file.filename)
                # make upload folder.
            try:
                os.makedirs(os.path.join(current_app.config['UPLOAD_FOLDER'],str(g.user["id"])))
            except OSError:
                pass

            file.save(os.path.join(current_app.config['UPLOAD_FOLDER'],str(g.user["id"]), filename))
            return redirect(url_for('upload.list'))
    return render_template('upload/create.html')

@bp.route('/<int:id>/view')
def single(id):
    return f'single {id} upload view'

@bp.route('/list')
@login_required
def list():
    return 'upload list'

@bp.route('/<int:id>/update')
@login_required
def update(id):
    return f'update {id} note'

@bp.route('/<int:id>/delete')
@login_required
def delete(id):
    return f'delete {id} upload'
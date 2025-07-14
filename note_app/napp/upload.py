from flask import Blueprint, render_template, flash, request, redirect, url_for, g, abort, current_app,send_from_directory
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
            return redirect(url_for('upload.create'))
        if file and allowed_file(file.filename):
            filename = secure_filename(file.filename)
                # make upload folder.
            current_app.logger.debug('I am trying to create directory')
            try:
                os.makedirs(os.path.join(current_app.config['UPLOAD_FOLDER'],str(g.user["id"])))
                current_app.logger.debug('apparently created dir')
            except OSError:
                current_app.logger.debug('do I silently fail?')
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
    items = None
    try:
        items = os.listdir(os.path.join(current_app.config['UPLOAD_FOLDER'],str(g.user["id"])))
    except OSError:
        items = ""
        current_app.logger.debug('failed to read directory.')
    return render_template('upload/list.html',items=items,user_id=str(g.user["id"]))

@bp.route("/<int:id>/<name>")
@login_required
def download_file(name,id):
    user_folder = None
    try:
        user_folder = os.path.join(current_app.config['UPLOAD_FOLDER'],str(g.user["id"]))
    except OSError:
        flash("user foulder not found")
        return redirect(url_for('upload.view'))
    # error handling above doesn't work. instead I get 404
    return send_from_directory(user_folder, name)

@bp.route('/<int:id>/<name>/delete')
@login_required
def delete_file(name,id):
    user_folder = os.path.join(current_app.config['UPLOAD_FOLDER'],str(g.user["id"]))
    file_name = os.path.join(user_folder,name)
    if os.path.isfile(file_name):
        os.remove(file_name)
    return redirect(url_for("upload.list"))
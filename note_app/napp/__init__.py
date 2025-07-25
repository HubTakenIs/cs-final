import os

from flask import Flask


def create_app(test_config=None):
    # create and configure the app
    app = Flask(__name__, instance_relative_config=True)
    app.config.from_mapping(
        SECRET_KEY='dev',
        DATABASE=os.path.join(app.instance_path, 'napp.sqlite'),
        ALLOWED_EXTENSIONS = {'txt', 'pdf', 'png', 'jpg', 'jpeg', 'gif'},
        UPLOAD_FOLDER = os.path.join(app.instance_path, 'uploads')
    )
    app.logger.debug(f"App Root: {app.root_path}")
    app.logger.debug(f"App Instance: {app.instance_path}")

    if test_config is None:
        # load the instance config, if it exists, when not testing
        app.config.from_pyfile('config.py', silent=True)
    else:
        # load the test config if passed in
        app.config.from_mapping(test_config)

    # ensure the instance folder exists
    try:
        os.makedirs(app.instance_path)
    except OSError:
        pass
    # make upload folder.
    try:
        os.makedirs(app.config['UPLOAD_FOLDER'])
    except OSError:
        pass


    # a simple page that says hello
    @app.route('/hello') 
    def hello():
        return 'Hello, World!'
    
    # register db code with app
    from . import db
    db.init_app(app)

    from werkzeug.middleware.proxy_fix import ProxyFix  
    app.wsgi_app = ProxyFix(
    app.wsgi_app, x_for=1, x_proto=1, x_host=1, x_prefix=1)

    # register auth blueprint.
    from . import auth
    app.register_blueprint(auth.bp)

    from . import main
    app.register_blueprint(main.bp)

    from . import note
    app.register_blueprint(note.bp)

    from . import reminder
    app.register_blueprint(reminder.bp)

    from . import upload
    app.register_blueprint(upload.bp)

    app.add_url_rule("/uploads/<name>", endpoint="download_file", build_only=True)

    return app
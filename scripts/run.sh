echo "Activating the virtual environment."
# On this version of linux, "source" is not recognized when
# running a shell script. "." is an alternate to "source".
. ~/venvs/SmartMirrorBackendEnv/bin/activate

# ============ Flask - Preprod / Dev ==========================
echo "Starting Pre-Prod instance."
# inside /scripts folder, so need to drop back one directory
cd ..
FLASK_APP=app.py flask run
# =============================================================

# ============ Gunicorn - Prod ================================
# echo "Starting Prod instance."
# inside /scripts folder, so need to drop back two directories
# cd ../..
# gunicorn Smart_Mirror_Backend.app:app
# =============================================================
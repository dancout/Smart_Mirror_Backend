# ============ Activating Virtual Environment ==========================
echo "Activating the virtual environment."
source ~/venvs/SmartMirrorBackendEnv/bin/activate
# The following functions assume you're inside the /scripts folder
cd ~/Smart_Mirror_Backend/scripts

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
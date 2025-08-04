#!/bin/bash
cd frontend
npm install
npm run build

cd ..
pip install -r requirements.txt

# Move React build output to Flask's static folder (if needed)
cp -r frontend/build/* ./frontend/build/

# Start Flask with Gunicorn
gunicorn -w 4 -b 0.0.0.0:$PORT app:app

from keystone.server.wsgi import initialize_public_application

app = initialize_public_application()
# print(app.url_map)
app.run(debug=True, host='0.0.0.0', port=5000)

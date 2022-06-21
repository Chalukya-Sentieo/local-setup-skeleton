import script
from sentieopackages.sentieoconfig import generic_conf

def app(environ, start_response):
        data = b'{"msg": "Hello, World!"}'
        start_response("200 OK", [
            ("Content-Type", "application/json"),
            ("Content-Length", str(len(data)))
        ])
        return iter([data])

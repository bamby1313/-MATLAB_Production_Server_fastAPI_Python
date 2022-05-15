from fastapi import FastAPI
from fastapi import Request

app = FastAPI()

@app.post("/customProcessing/")
def customProcessing(a: float, thd: float, request: Request):
    if a > thd:
        y = 1
    else:
        y = 0
    client_host = request.client.host
    return {"client_host": client_host, "y": y}

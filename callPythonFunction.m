function y = callPythonFunction(a, thd)

% import net packages
import matlab.net.*
import matlab.net.http.*
import matlab.net.http.fields.*

% fastAPI set up
url         = "http://127.0.0.1:8000/customProcessing";
param_a     = "?a=";
param_thd   = "&thd=";

% Build request
requestUri1     = URI(url + "/" + param_a + num2str(a) + param_thd + num2str(thd));
body            = MessageBody;
payload         = mps.json.encoderequest({}, "Nargout", 0); % Empty body 
body.Payload    = payload; 
options         = matlab.net.http.HTTPOptions('ConnectTimeout',50,'ConvertResponse',false);
request         = RequestMessage;
request.Header  = HeaderField('Content-Type','application/json');
request.Method  = 'POST';
request.Body    = body;

% Send request
response    = request.send(requestUri1, options);
r           = jsondecode(response.Body.Data);
y           = r.y;

end
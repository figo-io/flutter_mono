String monoConnect(String? key) => '''
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Mono Connect</title>
</head>

<body onload="setupMonoConnect()" style="border-radius: 20px; background-color:#fff;height:100vh;overflow: hidden; ">
    <script src="https://connect.withmono.com/connect.js"></script>
    <script type="text/javascript">
        window.onload = setupMonoConnect;
        function setupMonoConnect() {
            var connect;
            var config = {
                key: "$key",
                onSuccess: function (data) {
                    const response = { "type": "mono.modal.linked", response: { ...data } }
                    MonoClientInterface.postMessage(JSON.stringify(response))
                },
                onClose: function () {
                    const response = { type: 'mono.modal.closed', }
                    MonoClientInterface.postMessage(JSON.stringify(response))
                }
            };
            connect = new Connect(config)
            connect.setup()
            connect.open()
        }
    </script>
</body>

</html>
''';

function fn() {
    karate.configure('connectTimeout', 60000);
    karate.configure('readTimeout', 60000);
    karate.configure('logPrettyResponse', true);

    var env = karate.env;

    var config = {
        env: env
    }

    config.baseUrl = 'https://petstore.swagger.io/v2/';

    return config;
}
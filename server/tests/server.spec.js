const app = require('../src/app');
const request = require('supertest');
const pool = require('../src/model/connectDatabase');


describe('GET /v1/universidad/', () => {
    test('should respond with a 200 status code', async () => {
        const response = await request(app).get('/v1/universidad/').send();
        expect(response.statusCode).toBe(200);
    })

    test('should respond with a Object', async () => {
        const response = await request(app).get('/v1/universidad/').send();
        expect(response.body).toBeInstanceOf(Object);
    })
});

describe('GET /v1/universidad/:id', () => {
    test('should respond with a 200 status code', async () => {
        const response = await request(app).get('/v1/universidad/1').send();
        expect(response.status).toBe(200);
    })

    test('should respond with a 400 status code', async () => {
        const response = await request(app).get('/v1/universidad/as').send();
        expect(response.status).toBe(400);
    })

    test('should respond with a 500 status code', async () => {
        const response = await request(app).get('/v1/universidad/1000').send();
        expect(response.status).toBe(500);
    })

    test('should respond with a Object', async () => {
        const response = await request(app).get('/v1/universidad/1').send();
        expect(response.body).toBeInstanceOf(Object);
    })
});

describe('GET /v1/universidad/area/:id', () => {
    test('should respond with a 200 status code', async () => {
        const response = await request(app).get('/v1/universidad/area/1').send();
        expect(response.status).toBe(200);
    })

    test('should respond with a 400 status code', async () => {
        const response = await request(app).get('/v1/universidad/area/as').send();
        expect(response.status).toBe(400);
    })

    test('should respond with a 500 status code', async () => {
        const response = await request(app).get('/v1/universidad/area/1000').send();
        expect(response.status).toBe(500);
    })

    test('should respond with a Object', async () => {
        const response = await request(app).get('/v1/universidad/area/1').send();
        expect(response.body).toBeInstanceOf(Object);
    })
});

describe('GET /v1/universidad/ofertaeducativa/:id', () => {
    test('should respond with a 200 status code', async () => {
        const response = await request(app).get('/v1/universidad/ofertaeducativa/1').send();
        expect(response.status).toBe(200);
    })

    test('should respond with a 400 status code', async () => {
        const response = await request(app).get('/v1/universidad/ofertaeducativa/as').send();
        expect(response.status).toBe(400);
    })

    test('should respond with a 500 status code', async () => {
        const response = await request(app).get('/v1/universidad/ofertaeducativa/1000').send();
        expect(response.status).toBe(500);
    })

    test('should respond with a Object', async () => {
    const response = await request(app).get('/v1/universidad/ofertaeducativa/1').send();
    expect(response.body).toBeInstanceOf(Object);
    })
});

describe('GET /v1/universidad/multimedia/:id', () => {
    test('should respond with a 200 status code', async () => {
        const response = await request(app).get('/v1/universidad/multimedia/1').send();
        expect(response.status).toBe(200);
    })

    test('should respond with a 400 status code', async () => {
        const response = await request(app).get('/v1/universidad/multimedia/as').send();
        expect(response.status).toBe(400);
    })

    test('should respond with a 500 status code', async () => {
        const response = await request(app).get('/v1/universidad/multimedia/1000').send();
        expect(response.status).toBe(500);
    })

    test('should respond with a Object', async () => {
    const response = await request(app).get('/v1/universidad/multimedia/1').send();
    expect(response.body).toBeInstanceOf(Object);
    })
});

describe('GET /v1/universidad/direccion/:id', () => {
    test('should respond with a 200 status code', async () => {
        const response = await request(app).get('/v1/universidad/direccion/1').send();
        expect(response.status).toBe(200);
    })

    test('should respond with a 400 status code', async () => {
        const response = await request(app).get('/v1/universidad/direccion/as').send();
        expect(response.status).toBe(400);
    })

    test('should respond with a 500 status code', async () => {
        const response = await request(app).get('/v1/universidad/direccion/1000').send();
        expect(response.status).toBe(500);
    })

    test('should respond with a Object', async () => {
    const response = await request(app).get('/v1/universidad/direccion/1').send();
    expect(response.body).toBeInstanceOf(Object);
    })
});

describe('GET /v1/universidad/maps/:id', () => {
    test('should respond with a 200 status code', async () => {
        const response = await request(app).get('/v1/universidad/maps/1').send();
        expect(response.status).toBe(200);
    })

    test('should respond with a 400 status code', async () => {
        const response = await request(app).get('/v1/universidad/maps/as').send();
        expect(response.status).toBe(400);
    })

    test('should respond with a 500 status code', async () => {
        const response = await request(app).get('/v1/universidad/maps/1000').send();
        expect(response.status).toBe(500);
    })

    test('should respond with a Object', async () => {
    const response = await request(app).get('/v1/universidad/maps/1').send();
    expect(response.body).toBeInstanceOf(Object);
    })
});

describe('PAGE NO FOUND', () => {
    test('GET should respond with a 404 status code', async () => {
        const response = await request(app).get('/').send();
        expect(response.statusCode).toBe(404);
        expect(response.body.message).toBe('Page not found');
    })
});


afterAll(() => {
    pool.end();
});
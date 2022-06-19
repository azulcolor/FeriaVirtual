const app = require('../src/app');
const request = require('supertest');

describe('GET /v1/universidad', () => {
    test('Should respond with a 200 status code', async ()=> {
        const response = await request(app).get('/v1/universidad').send();
        console.log(response);
    });
});
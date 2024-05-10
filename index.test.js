const { firsthandler, secondhandler } = require('./index')

describe('firsthandler', () => {
  it('should return status code 200 and the correct message', async () => {
    const event = {};
    const expectedResponse = {
      statusCode: 200,
      body: JSON.stringify({
        message: "This is get function!",
      }, null, 2),
    };
    const result = await firsthandler(event);
    expect(result).toEqual(expectedResponse);
  });
});

describe('secondhandler', () => {
  it('should return status code 200 and the correct message', async () => {
    const event = {};
    const expectedResponse = {
      statusCode: 200,
      body: JSON.stringify({
        message: "This is post function!",
      }, null, 2),
    };
    const result = await secondhandler(event);
    expect(result).toEqual(expectedResponse);
  });
});
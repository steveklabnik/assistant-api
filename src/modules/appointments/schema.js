module.exports = {
  body: {
    properties: {
      id: {
        type: 'integer'
      },
      links: {
        artist: {
          type: 'string'
        },
        customer: {
          type: 'string'
        }
      }
    }
  }
};

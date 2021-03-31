import { Auth } from './auth';

const auth = new Auth();

describe('auth', () => {
  it('should work', () => {
    expect(auth.showName()).toEqual('testing publish');
  });
});

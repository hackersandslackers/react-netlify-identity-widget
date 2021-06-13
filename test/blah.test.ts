function sum(a: number, b: number) { return a + b; }


describe('sum', () => {
  it('returns 4 for [1, 3]', () => expect(sum(1, 3)).toBe(4));
});

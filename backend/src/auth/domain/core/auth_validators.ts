export function validateEmail(email: string): boolean{
    const emailValid: boolean = new RegExp(
        /^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+/)
    .test(email);
    return emailValid;
}

export function validatePassword(password: string) : boolean{
    const passwordShort: boolean = password.length < 8;
    return !passwordShort;
}
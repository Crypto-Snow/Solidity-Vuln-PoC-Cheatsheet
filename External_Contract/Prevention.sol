
// Initialize a new contract inside the constructor
// Make the address of external contract public so that the code of the external contract can be reviewed

Bar public bar;

constructor() public {
    bar = new Bar();
}

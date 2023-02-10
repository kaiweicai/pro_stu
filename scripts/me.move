// scripts/run_hello.move
script {
    use 0x1::HelloWorld;
    use std::debug;

    fun main() {
        let five = HelloWorld::gimme_five();
        debug::print(&five);
    }
}

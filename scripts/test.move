script{
    use std::debug;

    const ONE:u64 = 1;

    fun main(){
        let x = 10;
        let sum = x + ONE;
        debug::print(&sum);
    }
}
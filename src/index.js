// import { _bar } from './wasm/hello.wasm';
// console.log(_bar(3, 2));
(async () => {
    const memory = new WebAssembly.Memory({ initial: 256, maximum: 256 });
    const importObj = {
        env: {
            abortStackOverflow: () => {
                throw new Error('overflow');
            },
            table: new WebAssembly.Table({
                initial: 0,
                maximum: 0,
                element: 'anyfunc'
            }),
            __table_base: 0,
            memory: memory,
            __memory_base: 1024,
            STACKTOP: 0,
            STACK_MAX: memory.buffer.byteLength
        }
    };
    const res = await fetch('hello.wasm');
    const bytes = await res.arrayBuffer();
    const module = new WebAssembly.Module(bytes);
    const wasmInstance = new WebAssembly.Instance(module, importObj);
    const { _bar } = wasmInstance.exports;
    console.log(_bar(3, 3));
})();

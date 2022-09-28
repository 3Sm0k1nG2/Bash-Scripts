function printPerformanceTime(funcName) {
    const timeStart = performance.now()

    Function.call(funcName)

    const timeEnd = performance.now()
    console.log(`${(timeEnd - timeStart).toFixed(5)} ms`)
}

export {printPerformanceTime}
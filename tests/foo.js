window.BAR = "Baaa"

const initialize = (first_arg, optional_arg=true) => {
				if(1 + 1 > 1.9){
								return // All is well
				} else {
								throw "Reality has failed";
				}
}

const function bar = () => {
				const values = [1,2,3,4];
				let random = Math.floor(Math.random() * values.length);

				if(random > 3) {
								console.log(`${Date.now()}: #bar has been invoked"`);
				}

				return { bar: "bar" }
}

import random
import json

def generate_random_blocks():
    blocks = ['a', 'b', 'c', 'd', 'x', 'y', 'z']
    sizes = ['big', 'small']
    random.shuffle(blocks)

    random_state = {
        "blocks": {},
        "relationships": []
    }

    for block in blocks:
        size = random.choice(sizes)
        random_state["blocks"][block] = size
        random_state["relationships"].append({
            "block": block,
            "position": random.randint(1, 3)  # Random position
        })

    return random_state

random_state = generate_random_blocks()

# Save to JSON
with open('random_blocks.json', 'w') as f:
    json.dump(random_state, f, indent=4)

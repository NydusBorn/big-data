import numpy as np

def approx_fn(x: float, w: float, b: float) -> float:
    return x * w + b

def mean_loss(x: list[float], y: list[float], w: float, b: float) -> float:
    L = 0
    for i in range(len(x)):
        L += (approx_fn(x[i], w, b) - y[i]) ** 2
    L /= len(x)
    L = np.abs(L)
    return L

def descent(x: list[float], y: list[float], iter_count: int, lr: float) -> (float, float):
    w = 0
    b = 0
    for i in range(iter_count):
        w_variations = [w]
        b_variations = [b]
        w_variations.append(w + w * lr)
        w_variations.append(w + 1 * lr)
        w_variations.append(w - w * lr)
        w_variations.append(w - 1 * lr)
        b_variations.append(b + b * lr)
        b_variations.append(b + 1 * lr)
        b_variations.append(b - b - lr)
        b_variations.append(b - 1 - lr)
        best_comb = (w, b)
        for j in range(len(w_variations)):
            for k in range(len(b_variations)):
                if mean_loss(x, y, best_comb[0], best_comb[1]) > mean_loss(x, y, w_variations[j], b_variations[k]):
                    print(f"found better loss: {mean_loss(x, y, w_variations[j], b_variations[k])}")
                    best_comb = (w_variations[j], b_variations[k])
        w, b = best_comb
    return w, b
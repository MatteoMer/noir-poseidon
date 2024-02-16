//we have to use matrix in 1D in noir
pub fn multiplication<M, N>(state: [Field; N], matrix: [Field; M], nb_rows: Field) -> [Field; N] {
    let num_columns = M / nb_rows; // Assuming `M` is divisible by `nb_rows`
    let mut result: [Field; N] = [0; N];

    for i in 0..N {
        for _j in 0..num_columns {
            let mut sum = 0;
            for k in 0..num_columns {
                let matrix_index = i * num_columns + k;
                let state_index = k;
                sum = sum + matrix[matrix_index] * state[state_index];
            }
            result[i] = sum;
        }
    }

    result
}


function out = test2(in, index_in) % Comment
    persistent a index c % Comment
    if isempty(a)
        a = 1;
        c = a;
    end

    test = 3;

    in = in.^a;
    index = index_in + 1;
    a = a*3 + c;

    %% Test section in function
    out = new_fun(index, in);
    out = secondaryFunction(out);

    %% Test function in function
    function y = new_fun(x, z)
        persistent y_old
        if isempty(y_old)
            y_old = 0;
        end

        % 'a' should be highlighted
        y = x.^z + y_old + a + test;
        y_old = y;
    end
end

function y = secondaryFunction(x)
    persistent test
    if isempty(test)
        test = x;
    end

    % 'index' and 'c' should not be highlighted
    index = test;
    y = c^2 + index;
end

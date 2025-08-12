function A = struct2vec(Struct)
    c = struct2cell(Struct);
    A = [c{:}]';
end
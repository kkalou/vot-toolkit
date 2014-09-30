function [document] = report_sequences_preview(context, sequences, varargin)

document = create_document(context, 'sequences', 'title', 'Sequences preview');

frames = 6;

for i = 1:2:length(varargin)
    switch lower(varargin{i}) 
        case 'frames'
            frames = varargin{i+1};
        otherwise 
            error(['Unknown switch ', varargin{i}, '!']) ;
    end
end 


for s = 1:length(sequences)

    print_indent(1);

    print_text('Processing sequence %s ...', sequences{s}.name);

    fprintf(index_fid, '<div class="grid_small">\n');
    
    document.figure(@() generate_sequence_strip(sequences{s}, {}, 'samples', frames, 'window', Inf), ...
        sequences{s}.name, sprintf('Sequence %s', sequences{s}.name));

    fprintf(index_fid, '</div>\n');
    
    print_indent(-1);

end;





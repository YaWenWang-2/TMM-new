# Cross-document references: build main.aux when supplementary.tex needs it.
# Adapted from John Collins's example published by Overleaf:
# https://www.overleaf.com/learn/how-to/Cross_referencing_with_the_xr_package_in_Overleaf
$sub_doc_output = 'output-subdoc';
@sub_doc_options = ('-pdf', '-interaction=nonstopmode', '-halt-on-error');
push @file_not_found, '^No file\s*(.+)\s*$';
add_cus_dep('tex', 'aux', 0, 'makeexternaldocument');

sub makeexternaldocument {
    return 0 if $root_filename eq $_[0];
    my ($base_name, $path) = fileparse($_[0]);
    pushd $path;
    my $result = system 'latexmk', @sub_doc_options,
        "-aux-directory=$sub_doc_output",
        "-output-directory=$sub_doc_output", $base_name;
    if ($result == 0 && -f "$sub_doc_output/$base_name.aux") {
        rdb_add_generated("$sub_doc_output/$base_name.aux");
        copy "$sub_doc_output/$base_name.aux", '.'
            or die "Cannot copy reference data: $!";
    }
    popd;
    return $result;
}

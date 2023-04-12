calculateTax(LowerThreshold, UpperThreshold, PercentageTax, Value, Tax) :-
    Value > UpperThreshold,
    !,
    TaxableAmount is UpperThreshold - LowerThreshold,
    Tax is (TaxableAmount * PercentageTax)/100.

calculateTax(LowerThreshold, UpperThreshold, PercentageTax, Value, Tax) :-
    Value =< UpperThreshold,
    Value > LowerThreshold,
    TaxableAmount is Value - LowerThreshold,
    Tax is (TaxableAmount * PercentageTax)/100.

%% Does Prolog have data structures
%% No accumulator
calculateTaxFromBands([], _, 0).
calculateTaxFromBands([[LowerThreshold, UpperThreshold, PercentageTax]|RestOfBands], Value, TotalTax) :-
    calculateTax(LowerThreshold, UpperThreshold, PercentageTax, Value, TaxForCurrentBand),
    calculateTaxFromBands(RestOfBands, Value, TaxOfRestOfBands),
    TotalTax is TaxForCurrentBand + TaxOfRestOfBands.

%% With accumulator

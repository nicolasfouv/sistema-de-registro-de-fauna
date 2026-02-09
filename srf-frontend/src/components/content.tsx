import { useEffect, useState, useMemo } from "react";
import React, { type ReactNode } from "react";
import { FilterBar } from "./filterbar";

export interface ColumnProps<T> {
    key: keyof T | string,
    label: string,
    width?: string,
}

export interface ContentProps<T> {
    id: string,
    label: string,
    columns: ColumnProps<T>[],
    data: T[],
    rowIdField: keyof T,
    renderActions: (item: T, isExpanded: boolean, toggleRow: (id: string) => void) => ReactNode,
    renderExpansion?: (item: T, close: () => void) => ReactNode,
    toolBar?: ReactNode,
}

export interface PageProps {
    title: string,
    activeFormId: string,
    formChange: (formId: string) => void,
    contents: ContentProps<any>[],
}

export function Content({
    title,
    activeFormId,
    formChange,
    contents,
}: PageProps) {
    const activeContent = contents.find(content => content.id === activeFormId);
    const [expandedId, setExpandedId] = useState<string | null>(null);
    const [filteredData, setFilteredData] = useState(activeContent?.data);
    const [sortConfig, setSortConfig] = useState<{ key: string | null, direction: 'asc' | 'desc' }>({ key: null, direction: 'asc' });

    useEffect(() => {
        setFilteredData(activeContent?.data);
        setExpandedId(null);
        setSortConfig({ key: null, direction: 'asc' });
    }, [activeContent])

    function toggleRow(id: string) {
        setExpandedId(prev => (prev === id ? null : id));
    }

    function handleFilter(column: string, term: string) {
        const searchTerm = term.toLocaleLowerCase();
        const newData = activeContent?.data.filter(item =>
            String(item[column]).toLowerCase().includes(searchTerm)
        );
        setFilteredData(newData);
    }

    function handleSort(key: string | any) {
        setSortConfig(prev => {
            if (prev.key === key) {
                return { key, direction: prev.direction === 'asc' ? 'desc' : 'asc' };
            }
            return { key, direction: 'asc' };
        });
    }

    const sortedData = useMemo(() => {
        if (!filteredData) return [];
        if (!sortConfig.key) return filteredData;

        return [...filteredData].sort((a, b) => {
            const aValue = String(a[sortConfig.key!]).toLowerCase();
            const bValue = String(b[sortConfig.key!]).toLowerCase();

            if (aValue < bValue) return sortConfig.direction === 'asc' ? -1 : 1;
            if (aValue > bValue) return sortConfig.direction === 'asc' ? 1 : -1;
            return 0;
        });
    }, [filteredData, sortConfig]);

    return (
        <section className="ml-sidebar-size p-8 min-h-screen min-w-[600px] text-text-main">

            {/* Header */}
            <h1 className="text-standard-red font-bold text-xl mb-3 uppercase">{title}</h1>

            <div className="max-2-6xl mx-auto bg-white rounded shadow-sm border border-border">
                {/* Tabs */}
                <div className="px-6 pt-4 border-b border-border mb-6">
                    <div className="flex gap-2">
                        {contents.map((content) => (
                            <button
                                key={content.id}
                                onClick={() => formChange(content.id)}
                                className={`pb-3 px-6 text-sm font-bold transition-all relative ${activeFormId === content.id ? 'text-standard-red border-b-2 border-standard-red' : 'text-text-main hover:text-standard-red'}`}
                            >
                                {content.label}
                            </button>
                        ))}
                    </div>
                </div>

                {/* ToolBar */}
                {activeContent?.toolBar && activeContent?.toolBar}

                <FilterBar
                    key={activeContent?.id}
                    columns={activeContent?.columns || []}
                    onFilter={handleFilter}
                />

                {/* Table */}
                <div className="px-6 pb-6">
                    <table className="w-full border-collapse">
                        <thead>
                            <tr className="bg-form-bg border-b border-border">
                                {activeContent?.columns.map(col => (
                                    <th
                                        key={String(col.key)}
                                        className={`px-4 py-3 text-left text-sm font-bold text-text-main ${col.width ?? ''} cursor-pointer hover:bg-black/5 select-none`}
                                        onClick={() => handleSort(col.key)}
                                    >
                                        <div className="flex items-center gap-1">
                                            {col.label}
                                            {sortConfig.key === col.key && (
                                                <span>{sortConfig.direction === 'asc' ? '▲' : '▼'}</span>
                                            )}
                                        </div>
                                    </th>
                                ))}
                                <th className="px-4 py-3 text-sm font-bold text-text-main text-right pr-6">Ações</th>
                            </tr>
                        </thead>
                        <tbody>
                            {sortedData && sortedData.length > 0 && sortedData.map((item) => {
                                const id = item[activeContent?.rowIdField!] as unknown as string;
                                const isExpanded = expandedId === id;

                                if (!isExpanded) {
                                    return (
                                        <React.Fragment key={id}>

                                            <tr className="border-b border-border">
                                                {activeContent?.columns.map(col => (
                                                    <td key={String(col.key)} className="px-4 py-4 text-sm text-text-main">
                                                        {String(item[col.key])}
                                                    </td>
                                                ))}
                                                <td className="px-4 py-4 text-right">
                                                    {activeContent?.renderActions!(item, isExpanded, () => toggleRow(id))}
                                                </td>
                                            </tr>
                                        </React.Fragment>
                                    )
                                } else {
                                    {/* Expansion */ }
                                    return (
                                        <React.Fragment key={id}>

                                            {activeContent?.renderExpansion && (
                                                <tr>
                                                    <td colSpan={activeContent.columns.length + 1}>
                                                        <div className="bg-form-bg border border-border rounded my-2 p-4">
                                                            {activeContent?.renderExpansion!(item, () => setExpandedId(null))}
                                                        </div>
                                                    </td>
                                                </tr>
                                            )}

                                        </React.Fragment>
                                    )
                                }
                            })}
                        </tbody>
                    </table>
                    {sortedData?.length === 0 && (
                        <div className="px-4 py-4 text-center text-sm text-text-main">
                            Nenhum dado encontrado.
                        </div>
                    )}
                </div>
            </div>
        </section>
    );
}
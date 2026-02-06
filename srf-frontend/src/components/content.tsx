import { useState } from "react";
import React, { type ReactNode } from "react";

export interface ColumnProps<T> {
    key: keyof T | string,
    label: string,
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
    activeTabId: string,
    onTabChange: (tabId: string) => void,
    contents: ContentProps<any>[],
}

export function Content({
    title,
    activeTabId,
    onTabChange,
    contents,
}: PageProps) {
    const [expandedId, setExpandedId] = useState<string | null>(null);

    function toggleRow(id: string) {
        setExpandedId(prev => (prev === id ? null : id));
    }

    return (
        <section className="ml-sidebar-size p-8 min-h-screen min-w-[600px] text-text-main">

            {/* Header */}
            <h1 className="text-standard-red font-bold text-xl mb-3 uppercase">{title}</h1>

            <div className="max-2-6xl mx-auto bg-white rounded shadow-sm border border-border">

                {/* Tabs */}
                <div className="px-6 pt-4 border-b border-border">
                    <div className="flex gap-2">
                        {contents.map((content) => (
                            <button
                                key={content.id}
                                onClick={() => onTabChange(content.id)}
                                className={`pb-3 px-6 text-sm font-bold transition-all relative ${activeTabId === content.id ? 'text-standard-red border-b-2 border-standard-red' : 'text-text-main hover:text-standard-red'}`}
                            >
                                {content.label}
                            </button>
                        ))}
                    </div>
                </div>

                {/* ToolBar */}
                {contents.find(content => content.id === activeTabId)?.toolBar && (
                    <div className="p-6 bg-white">
                        {contents.find(content => content.id === activeTabId)?.toolBar}
                    </div>
                )}

                {/* Table */}
                <div className="px-6 pb-6">
                    <table className="w-full border-collapse">
                        <thead>
                            <tr className="bg-form-bg border-b border-border">
                                {contents.find(content => content.id === activeTabId)?.columns.map(col => (
                                    <th key={String(col.key)} className="px-4 py-3 text-left text-sm font-bold text-text-main">
                                        {col.label}
                                    </th>
                                ))}
                                <th className="px-4 py-3 text-right text-sm font-bold text-text-main">Ações</th>
                            </tr>
                        </thead>
                        <tbody>
                            {contents.find(content => content.id === activeTabId)?.data.map((item) => {
                                const id = item[contents.find(content => content.id === activeTabId)!.rowIdField] as unknown as string;
                                const isExpanded = expandedId === id;

                                if (!isExpanded) {
                                    return (
                                        <React.Fragment key={id}>

                                            <tr className="border-b border-border">
                                                {contents.find(content => content.id === activeTabId)?.columns.map(col => (
                                                    <td key={String(col.key)} className="px-4 py-4 text-sm text-text-main">
                                                        {String(item[col.key])}
                                                    </td>
                                                ))}
                                                <td className="px-4 py-4 text-right">
                                                    {contents.find(content => content.id === activeTabId)?.renderActions!(item, isExpanded, () => toggleRow(id))}
                                                </td>
                                            </tr>
                                        </React.Fragment>
                                    )
                                } else {
                                    {/* Expansion */ }
                                    return (
                                        <React.Fragment key={id}>

                                            {contents.find(content => content.id === activeTabId)?.renderExpansion && (
                                                <tr>
                                                    <td colSpan={contents.find(content => content.id === activeTabId)!.columns.length + 1}>
                                                        <div className="bg-form-bg border border-border rounded my-2 p-4">
                                                            {contents.find(content => content.id === activeTabId)?.renderExpansion!(item, () => setExpandedId(null))}
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
                </div>
            </div>
        </section>
    );
}